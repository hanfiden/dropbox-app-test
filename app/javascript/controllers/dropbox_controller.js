import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropbox"
export default class extends Controller {
  connect() {
    const options = {
      success: function (file) {
        const file_url = document.getElementById("dropbox-file-url");
        const file_name = document.getElementById("dropbox-file-name");
        const link_name = document.createElement('a');

        file_url.value = file[0].link;
        link_name.innerText = '';
        link_name.innerText = file[0].name;
        link_name.href = file[0].link;
        link_name.target = '_blank';
        file_name.appendChild(link_name);
      },
      cancel: function () {
      },
      multiselect: false,
      extensions: ['.pdf', '.doc', '.docx'],
    };

    const button = Dropbox.createChooseButton(options);
    document.getElementById("dropboxContainer").appendChild(button);
  }
}
