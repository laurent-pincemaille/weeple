const addNewGameBtn = document.getElementById("addNewGameBtn")
const homeBtn = document.getElementById("homeBtn")
const profileBtn = document.getElementById("profileBtn")

addNewGameBtn.addEventListener("click",(e)=>{
	e.preventDefault()
	console.log("new game added")
})
homeBtn.addEventListener("click",(e)=>{
	e.preventDefault()
	console.log("home")
})
profileBtn.addEventListener("click",(e)=>{
	e.preventDefault()
	console.log("profile")
})