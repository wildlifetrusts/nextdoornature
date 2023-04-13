const template = document.createElement("template");
template.innerHTML = `<input type="text" />`;

export default class extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ mode: "open" });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.searchResult = "";
    this._input = this._shadowRoot.querySelector("input");

    console.log("constructor");
    console.log(this._input);
  }

  connectedCallback() {
    console.log("connectedCallback");
    console.log(this._input);
    console.log(this.language);
    this._input.oninput = () => {
      if (this.language === "English")
        this.searchResult = this.englishSearch(this._input.value);
      if (this.language === "Welsh")
        this.searchResult = this.welshSearch(this._input.value);
      this.dispatchEvent(new CustomEvent("resultChanged"));
    };
  }

  englishSearch(input) {
    return input.toUpperCase();
  }

  welshSearch(input) {
    return input.split("").reverse().join("");
  }
}
