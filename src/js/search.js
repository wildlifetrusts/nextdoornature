const template = document.createElement("template");
template.innerHTML = `<slot></slot>`;

export default class extends HTMLElement {
  static get observedAttributes() {
    return ["search-input"];
  }

  constructor() {
    console.log("constructor");
    super();
    this._shadowRoot = this.attachShadow({ mode: "open" });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.searchResult = [];
    this.searchInput = [];
  }

  connectedCallback() {
    console.log("connectedCallback");
    this._input = this.firstChild;
    this._input.oninput = () => this.updateSearch();
    this.searchInput = JSON.parse(this.getAttribute("search-input"));
    console.log(this.searchInput.length);
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log("attributeChangedCallback");
    console.log({ name, oldValue, newValue });
    this.searchInput = JSON.parse(this.getAttribute("search-input"));
    console.log(this.searchInput.length);
    this.updateSearch();
  }

  updateSearch() {
    console.log("updateSearch");
    // some of these life cycle methods may trigger the function before the component has fully loaded
    if (!this._input) return;
    this.searchResult = this.searchInput;
    // because this code runs outside Elms event system we need to give
    // Elm a bit of space to update the DOM when the attribute changes before
    // updating. Perhaps there is some way to express this better in Elm.
    //
    // this pops dispatchEvent in the event loop and waits for the current callstack to clear
    // https://youtu.be/8aGhZQkoFbQ?t=893
    setTimeout(() => {
      this.dispatchEvent(new CustomEvent("resultChanged")); // this has stopped firing or stopped being read by elm
    }, 0);
  }
}
