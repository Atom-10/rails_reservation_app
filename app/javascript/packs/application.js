// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("DOMContentLoaded", function () {
  var checkInDate = document.getElementById("check-in-date");
  var checkOutDate = document.getElementById("check-out-date");

  checkInDate.addEventListener("change", function () {
    var selectedDate = new Date(checkInDate.value);
    selectedDate.setDate(selectedDate.getDate() + 1);
    var minDate = selectedDate.toISOString().split("T")[0];
    checkOutDate.min = minDate;
  });
});
