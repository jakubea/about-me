import { Elm } from './Main.elm';
import {
  getSelectedLanguage,
  setLangAttribute,
  subscribeSetLanguageStorage,
} from './js/selectedLanguage';

const selectedLanguage = getSelectedLanguage();

setLangAttribute(selectedLanguage);

const app = Elm.Main.init({
  node: document.getElementById('root'),
  flags: {
    selectedLanguage,
  },
});

subscribeSetLanguageStorage(app);
