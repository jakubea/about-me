import { translationsForSelectedLanguage } from './i18n/';
import { getSelectedLanguage } from './selectedLanguage';

export const getFlags = async () => {
  const selectedLanguage = getSelectedLanguage();
  const translations = await translationsForSelectedLanguage('En');

  return {
    translations: translations,
    selectedLanguage: 'En',
  };
};
