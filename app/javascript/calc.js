window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const taxPricePlace = document.getElementById("add-tax-price")
    const profitPlace = document.getElementById("profit")
    const onlyTax = Math.floor(inputValue * 10 / 100)

    taxPricePlace.innerHTML = onlyTax
    profitPlace.innerHTML = Math.floor(inputValue - onlyTax)
  })
})