customElements.define("mi-footer", class extends HTMLElement {
  connectedCallback() {
    this.innerText = "Derechos Reservados ©  2020 Jose Alejandro Ortiz Hernandez ";
  }
}, { extends: "footer" });