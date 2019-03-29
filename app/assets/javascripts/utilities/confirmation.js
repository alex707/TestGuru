document.addEventListener('turbolinks:load', function() {
  var field = document.getElementById('user_password_confirmation')

  if (field) { field.addEventListener('input', compareWithPassword) }
})

function compareWithPassword() {
  let pass = document.getElementById('user_password').value
  let confirm = this.value
  let icon = document.querySelector('.octicon-alert')

  if (confirm.length === 0) {
    icon.classList.add('hide')
  } else if (pass === confirm) {
    icon.classList.remove('hide', 'text-danger')
    icon.classList.add('text-success')
  } else {
    icon.classList.remove('hide', 'text-success')
    icon.classList.add('text-danger')
  }
}
