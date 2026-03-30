const LANGUAGE_STORAGE_KEY = '__about-bea__language__';
export const DEFAULT_LANGUAGE = 'en';
export const SUPPORTED_LANGUAGES = ['cs', 'en', 'es', 'sk'];

const getPreferredLanguage = () => {
  if (typeof navigator === 'undefined') {
    return null;
  }

  if (Array.isArray(navigator.languages) && navigator.languages.length > 0) {
    return navigator.languages[0];
  }

  return navigator.language ?? null;
};

export const normalizeLanguage = (language) => {
  if (typeof language !== 'string') {
    return null;
  }

  const normalizedLanguage = language.trim().toLowerCase().slice(0, 2);

  if (SUPPORTED_LANGUAGES.includes(normalizedLanguage)) {
    return normalizedLanguage;
  }

  return null;
};

export const getSelectedLanguage = () =>
  normalizeLanguage(getStoredLanguage()) ??
  normalizeLanguage(getPreferredLanguage()) ??
  DEFAULT_LANGUAGE;

export const setLangAttribute = (language) =>
  typeof document !== 'undefined'
    ? document.documentElement.setAttribute(
        'lang',
        normalizeLanguage(language) ?? DEFAULT_LANGUAGE,
      )
    : undefined;

export const setSelectedLanguage = (language) => {
  const normalizedLanguage = normalizeLanguage(language) ?? DEFAULT_LANGUAGE;

  try {
    localStorage.setItem(LANGUAGE_STORAGE_KEY, normalizedLanguage);
  } catch {}

  setLangAttribute(normalizedLanguage);
};

const getStoredLanguage = () => {
  try {
    return localStorage.getItem(LANGUAGE_STORAGE_KEY);
  } catch {
    return null;
  }
};

export const subscribeSetLanguageStorage = (app) => {
  app.ports.setLanguageStorage.subscribe((payload) => {
    const language = typeof payload === 'string' ? payload : payload?.language;

    setSelectedLanguage(language);
  });
};
