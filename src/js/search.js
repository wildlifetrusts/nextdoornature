const template = document.createElement("template");
template.innerHTML = `<slot></slot>`;

export default class extends HTMLElement {
  static get observedAttributes() {
    return ["language"];
  }

  constructor() {
    console.log("constructor");
    super();
    this._shadowRoot = this.attachShadow({ mode: "open" });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.searchResult = "";
  }

  connectedCallback() {
    console.log("connectedCallback");
    this._input = this.firstChild;
    this._input.oninput = () => this.updateSearch();
  }

  attributeChangedCallback() {
    console.log("attributeChangedCallback");
    this.updateSearch();
  }

  updateSearch() {
    console.log("updateSearch");
    // some of these life cycle methods may trigger the function before the component has fully loaded
    if (!this._input) return;
    if (this.getAttribute("language") === "English")
      this.searchResult = this.englishSearch(this._input.value);
    if (this.getAttribute("language") === "Welsh")
      this.searchResult = this.welshSearch(this._input.value);
    // because this code runs outside Elms event system we need to give
    // Elm a bit of space to update the DOM when the lang changes before
    // updating. Perhaps there is some way to express this better in Elm.
    //
    // this pops dispatchEvent in the event loop and waits for the current callstack to clear
    // https://youtu.be/8aGhZQkoFbQ?t=893
    setTimeout(() => {
      this.dispatchEvent(new CustomEvent("resultChanged"));
    }, 0);
  }

  englishSearch(input) {
    return input.toUpperCase();
  }

  welshSearch(input) {
    return input.split("").reverse().join("");
  }
}
