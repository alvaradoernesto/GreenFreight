const addLoads = () => {
  const loadsSelection = document.getElementById("loads-selection")
  if (loadsSelection) {
    const loadsSelect = document.getElementById("loads_ids");
    console.log(loadsSelect)
    const buttons = document.querySelectorAll(".add-load");
    buttons.forEach((button) => {
      const id = button.dataset.id
      button.addEventListener("click", (event) => {
        event.preventDefault();
        console.log(id)
        Array.from(loadsSelect.options).forEach((option) => {
          let option_value = option.value;
          let is_option_selected = option.selected;
          if (option.value == id) {
            if (is_option_selected) {
              option.selected = false
              button.classList.remove("active")
            } else {
              option.selected = true
              button.classList.add("active")
            }
          }
        });
      })
    })
  }
}

export {addLoads}


