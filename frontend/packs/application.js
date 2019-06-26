/* eslint no-console:0 */

import 'bootstrap';
import 'stylesheets/application';
// import { pickingGender } from './gender-pick';

document.addEventListener('DOMContentLoaded', () => {
   const picking = document.querySelectorAll('.gender-pick')
   picking.forEach((picked) => picked.addEventListener('click', (pick) => { console.log(pick.currentTarget.dataset.gender) }))
})

