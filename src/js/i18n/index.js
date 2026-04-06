import { DEFAULT_LANGUAGE, normalizeLanguage } from '../selectedLanguage';

const translationLoaders = {
  cs: () => import('./cs.json'),
  en: () => import('./en.json'),
  es: () => import('./es.json'),
  sk: () => import('./sk.json'),
};

const flattenTranslations = (value, prefix = '') => {
  if (value === null || typeof value !== 'object' || Array.isArray(value)) {
    return prefix ? { [prefix]: String(value ?? '') } : {};
  }

  return Object.entries(value).reduce((result, [key, nestedValue]) => {
    const nestedPrefix = prefix ? `${prefix}.${key}` : key;

    if (
      nestedValue !== null &&
      typeof nestedValue === 'object' &&
      !Array.isArray(nestedValue)
    ) {
      return {
        ...result,
        ...flattenTranslations(nestedValue, nestedPrefix),
      };
    }

    return {
      ...result,
      [nestedPrefix]: String(nestedValue ?? ''),
    };
  }, {});
};

export const translationsForSelectedLanguage = async (language) => {
  const selectedLanguage = normalizeLanguage(language) ?? DEFAULT_LANGUAGE;
  const loadTranslation =
    translationLoaders[selectedLanguage] ??
    translationLoaders[DEFAULT_LANGUAGE];

  try {
    const translation = await loadTranslation();

    return flattenTranslations(translation.default);
  } catch (error) {
    if (selectedLanguage !== DEFAULT_LANGUAGE) {
      console.warn(
        `Failed to load translations for "${selectedLanguage}", falling back to "${DEFAULT_LANGUAGE}".`,
        error,
      );
    }

    const fallbackTranslation = await translationLoaders[DEFAULT_LANGUAGE]();
    return flattenTranslations(fallbackTranslation.default);
  }
};

export const subscribeGetTranslationsForLanguage = (app) => {
  app.ports.getTranslationsForLanguage.subscribe(async (selectedLanguage) => {
    const newTranslations =
      await translationsForSelectedLanguage(selectedLanguage);

    app.ports.gotTranslationsForLanguage.send(newTranslations);
  });
};
