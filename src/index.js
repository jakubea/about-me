import { Elm } from './Main.elm';

import { getFlags } from './js/flags';

import { subscribeGetTranslationsForLanguage } from './js/i18n/';

import { subscribeSetCanonical } from './js/canonical';

import {
  setLangAttribute,
  subscribeSetLanguageStorage,
} from './js/selectedLanguage';

const loadGoogleTagManager = () => {
  window.dataLayer = window.dataLayer || [];

  window.dataLayer.push({
    'gtm.start': new Date().getTime(),
    event: 'gtm.js',
  });

  const script = document.createElement('script');
  script.async = true;
  script.src = 'https://www.googletagmanager.com/gtm.js?id=GTM-W682DB8J';

  document.head.appendChild(script);
};

const loadGoogleTagManagerWhenIdle = () => {
  if ('requestIdleCallback' in window) {
    requestIdleCallback(loadGoogleTagManager);
  } else {
    setTimeout(loadGoogleTagManager, 2000);
  }
};

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
  loadGoogleTagManagerWhenIdle();
};

initializeElmApp();
