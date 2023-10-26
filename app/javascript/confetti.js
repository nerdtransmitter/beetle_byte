import JSConfetti from 'js-confetti'

const jsConfetti = new JSConfetti()

document.addEventListener('DOMContentLoaded', () => {
	console.log('confettis!')
	jsConfetti.addConfetti()
})
