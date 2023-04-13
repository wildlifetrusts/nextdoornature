const template = document.createElement("template");
template.innerHTML = `<input type="text" />`;

export default class extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ mode: "open" });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this._input = this._shadowRoot.querySelector("input");

    console.log("constructor");
    console.log(this._input);
  }

  connectedCallback() {
    console.log("connectedCallback");
    console.log(this._input);
    this._input.oninput = () => {
      console.log("recieved input: " + this._input.value);
    };
  }
}
