document.addEventListener('turbolinks:load', function() {
  var number = document.querySelector('.survey-number');
  var total = document.querySelector('.survey-total');
  var perc = (Math.round( (number.innerHTML/total.innerHTML)*100 ))

  var surveyId = number.dataset.surveyId
  var bar = document.querySelector('.progress-bar[data-survey-id="' + surveyId + '"]');

  bar.textContent = perc + '%';
  bar.style.width = perc + '%';
})
