
document.addEventListener("DOMContentLoaded", () => {
  const questionType = document.getElementById('question_type');
  const multipleChoiceForm = document.getElementsByClassName('multiple-choice')[0];
  const trueOrFalseForm = document.getElementsByClassName('true-or-false')[0];
  forms = [multipleChoiceForm, trueOrFalseForm];
  hideExceptSelected()

  questionType.addEventListener('change', e => {
   hideExceptSelected()
  })

  function hideExceptSelected() {
    forms.forEach((form, idx) => {
      if (questionType.selectedIndex === idx) {
        form.classList.remove('hidden');
      } else {
        form.classList.add('hidden');
      }
    })
  }
})
