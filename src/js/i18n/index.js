import { DEFAULT_LANGUAGE, normalizeLanguage } from '../selectedLanguage';

const translationLoaders = {
  cs: () => import('./cs.json'),
  en: () => import('./en.json'),
  es: () => import('./es.json'),
  sk: () => import('./sk.json'),
};

export const translationsForSelectedLanguage = async (language) => {
  const selectedLanguage = normalizeLanguage(language) ?? DEFAULT_LANGUAGE;
  const loadTranslation =
    translationLoaders[selectedLanguage] ??
    translationLoaders[DEFAULT_LANGUAGE];

  try {
    const translation = await loadTranslation();

    return translation.default;
  } catch (error) {
    if (selectedLanguage !== DEFAULT_LANGUAGE) {
      console.warn(
        `Failed to load translations for "${selectedLanguage}", falling back to "${DEFAULT_LANGUAGE}".`,
        error,
      );
    }

    const fallbackTranslation = await translationLoaders[DEFAULT_LANGUAGE]();
    return fallbackTranslation.default;
  }
};

export const subscribeGetTranslationsForLanguage = (app) => {
  app.ports.getTranslationsForLanguage.subscribe(async (selectedLanguage) => {
    const newTranslations =
      await translationsForSelectedLanguage(selectedLanguage);

    app.ports.gotTranslationsForLanguage.send(newTranslations);
  });
};
