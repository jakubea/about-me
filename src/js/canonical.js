export const subscribeSetCanonical = (app) => {
  app.ports.setCanonical.subscribe((path) => {
    const canonicalUrl = new URL(path, window.location.origin).href;

    let canonical = document.querySelector('link[rel="canonical"]');

    if (!canonical) {
      canonical = document.createElement('link');
      canonical.setAttribute('rel', 'canonical');
      document.head.appendChild(canonical);
    }

    canonical.setAttribute('href', canonicalUrl);
  });
};
