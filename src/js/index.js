import "/src/css/reset.css";
import { Elm } from "/src/Main.elm";
import SearchInput from "/src/js/search";

import cyGuides from "../../data/guides/cy.json";
import cyPages from "../../data/pages/cy.json";
import cyStories from "../../data/stories/cy.json";
import enGuides from "../../data/guides/en.json";
import enPages from "../../data/pages/en.json";
import enStories from "../../data/stories/en.json";

customElements.define("search-input", SearchInput);

const hasConsented = sessionStorage.getItem("ga-cookie-consent")
  ? sessionStorage.getItem("ga-cookie-consent")
  : "null";

const app = Elm.Main.init({
  flags: {
    hasConsented,
    guides: { cy: cyGuides, en: enGuides },
    pages: { cy: cyPages, en: enPages },
    stories: { cy: cyStories, en: enStories },
  },
});

app.ports.setMetadata.subscribe(function (pageMetadata) {
  const baseUrl = import.meta.env.VITE_BASE_URL ?? "https://nextdoornaturehub.org.uk";
  if (pageMetadata.hasOwnProperty("title")) {
    document.title = pageMetadata.title;
    document
      .getElementsByTagName("meta")
      .namedItem("og-title")
      .setAttribute("content", pageMetadata.title);
  }
  if (pageMetadata.hasOwnProperty("description")) {
    document
      .getElementsByTagName("meta")
      .namedItem("description")
      .setAttribute("content", pageMetadata.description);
    document
      .getElementsByTagName("meta")
      .namedItem("og-description")
      .setAttribute("content", pageMetadata.description);
  }
  if (pageMetadata.hasOwnProperty("imageSrc")) {
    document
      .getElementsByTagName("meta")
      .namedItem("og-image")
      .setAttribute("content", baseUrl + pageMetadata.imageSrc);
  }
});

app.ports.saveConsent.subscribe(function (hasConsented) {
  // User will have to re-consent every time browser is closed, but not on refresh.
  sessionStorage.setItem("ga-cookie-consent", hasConsented);
});

// Google analytics subscribe to page changes and custom events
app.ports.updateAnalyticsPage.subscribe(function (page) {
  if (typeof window != undefined) {
    window.dataLayer = window.dataLayer || [];
    function gtag() {
      dataLayer.push(arguments);
    }
    gtag("js", new Date());

    // TODO this is temporarily @katjam dev account
    gtag("config", "G-D3VTD4SBDZ", { page_path: page });
  }
});

app.ports.updateAnalyticsEvent.subscribe(function (gaEvent) {
  if (typeof window != undefined) {
    window.dataLayer = window.dataLayer || [];
    function gtag() {
      dataLayer.push(arguments);
    }
    gtag("js", new Date());

    gtag("event", gaEvent.action, {
      event_category: gaEvent.category,
      event_label: gaEvent.label,
    });
  }
});
