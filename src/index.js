import { Elm } from './Main.elm';

import { getFlags } from './js/flags';

import { subscribeGetTranslationsForLanguage } from './js/i18n/';
import { subscribeSetCanonical } from './js/canonical';
import {
  setLangAttribute,
  subscribeSetLanguageStorage,
} from './js/selectedLanguage';

const initializeElmApp = async () => {
  const flags = await getFlags();

  setLangAttribute(flags.selectedLanguage);

  const app = Elm.Main.init({
    node: document.getElementById('root'),
    flags,
  });

  subscribeSetLanguageStorage(app);
  subscribeGetTranslationsForLanguage(app);
  subscribeSetCanonical(app);
};

initializeElmApp();
