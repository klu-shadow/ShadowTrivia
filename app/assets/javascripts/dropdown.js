document.addEventListener('DOMContentLoaded', () => {
  const dropdown = document.getElementsByClassName('dropdown')[0];
  const button = document.getElementsByClassName('drop')[0];
  console.log(dropdown, button)
  if (!button) return;
  button.addEventListener('click', e => {
    dropdown.classList.toggle('show');
  })

  window.onclick = e => {
    if (!e.target.closest('.drop')) dropdown.classList.remove('show')
  }
})