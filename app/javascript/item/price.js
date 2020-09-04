window.addEventListener('load', function(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener('input', function(){
    let inputprice = document.getElementById("item-price").value;
    tax.innerHTML = Math.floor(inputprice * 0.1);
    profit.innerHTML = Math.floor(inputprice * 0.9);
  });
});