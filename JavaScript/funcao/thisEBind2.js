function Pessoa() {
	this.idade = 0

	const self = this
	setInterval(function() {
		self.idade++
		console.log(self.idade)
	}/*.bind(this)*/, 0.1)
}

new Pessoa
