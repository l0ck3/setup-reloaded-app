/* eslint no-console:0 */

// import 'bootstrap';
// import 'stylesheets/application';

document.addEventListener('DOMContentLoaded', () => {
  const selectGender = (pick) => {
    const selected = pick.currentTarget.dataset.gender
    pick.currentTarget.classList.toggle('selected-gender')
    const radioGender = document.querySelector(`#student_gender_${selected}`)
    if (radioGender) { radioGender.checked = true }
    const osPicked = document.querySelector(`#student_os_${selected}`)
    if (osPicked) { osPicked.checked = true }

  }
  const picking = document.querySelectorAll('.gender-pick')
  picking.forEach((picked) => picked.addEventListener('click', (pick) => { selectGender(pick) } ))

  // const fieldSet = document.querySelector('.student_gender')
  // fieldSet.classList.add('hidden')
})

