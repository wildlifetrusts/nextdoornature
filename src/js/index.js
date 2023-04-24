import reset from "/src/css/reset.css?inline";
import { Elm } from "/src/Main.elm";

import cyGuides from "../../data/guides/cy.json";
import enGuides from "../../data/guides/en.json";
import stories from "../../data/stories.json";
import pages from "../../data/pages.json";

const hasConsented = sessionStorage.getItem("ga-cookie-consent")
  ? sessionStorage.getItem("ga-cookie-consent")
  : "null";

const app = Elm.Main.init({
  flags: {
    hasConsented,
    guides: { cy: cyGuides, en: enGuides },
    stories,
    pages,
  },
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
