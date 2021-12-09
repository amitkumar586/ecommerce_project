
function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");

    if (cart == null)
    {
        let products = [];
        let product = {productId: pid, productname: pname, productQuantity: 1, productPrice: price};

        products.push(product);

        //update the product on our pc's localStorage
        localStorage.setItem("cart", JSON.stringify(products));

      //  console.log("product is added for the first time");
        showToast("Item is added to cart");

    } else
    {
        let pcart = JSON.parse(cart);

        //find if any product available in pcart array

        let oldproduct = pcart.find((item) => item.productId == pid);
        if (oldproduct)
        {
            // only we have to increasse the quantity

            oldproduct.productQuantity = oldproduct.productQuantity + 1;

            // trverse in whole function using map
            pcart.map((item) =>
            {
                if (item.productId == oldproduct.productId)
                {
                    item.productQuantity = oldproduct.productQuantity;
                }
            });

            localStorage.setItem("cart", JSON.stringify(pcart));
           // console.log("product quantity is increased");
            showToast(oldproduct.productName+ " quantity is increased , Quantity = "+oldproduct.productQuantity);
        } else
        {
            // only we have to add the new product
            let product = {productId: pid, productname: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));

            //console.log("product is added ");
            showToast("Product is added to cart");
        }
    }

    updateCart();
}

// update cart
function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {

        console.log("cart is empty !!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any item</h3>");
        $(".checkout-btn").atte('disabled',true);

    } else
    {
        // there is something in cart to show
        console.log(cart);


        $(".cart-items").html(`( ${cart.length} )`);

        let table = `
                    
                <table  class= 'table'>
                <thead class='thead-light'>
                <tr>
                <th> Item Name</th>
                <th> Item Price</th>
                <th> Item Quantity</th>
                <th> Total Price</th>
                <th> Action</th>
                </tr>
        
               </thead>
     
                    `;

        let totalprice = 0;

        cart.map((item) => {

            table += `
            
            
            <tr>
            
                 <td> ${item.productname}</td>
                 <td> ${item.productPrice}</td>
                 <td> ${item.productQuantity}</td>
                 <td> ${item.productQuantity * item.productPrice }</td>
                 <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn-danger btn-sm' >Remove</button> </td>
            </tr>
        `
            totalprice += item.productPrice * item.productQuantity;

        })

        table = table + `
         
         <tr><td colspan='5' class='text-right  font-weight-bold m-5'>Total Price :${totalprice} </td></tr>
                
 
         </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").atte('disabled',false);
    }

}

//delete Item 
function deleteItemFromCart(pid)
{
   let cart =  JSON.parse(localStorage.getItem('cart'));
   
   let newcart = cart.filter((item)=>item.productId != pid)
   
   localStorage.setItem("cart",JSON.stringify(newcart)); 
   
   updateCart();
   
   showToast("Item is removed fron cart ");
}


$(document).ready(function ()
{
    updateCart();
})

//toast

 function showToast(content)
    {
        $("#toast").addClass("display");
        $("#toast").html(content);
        setTimeout(()=>{
            $("#toast").removeClass("display");
        },2000);
    }

function goToCheckout()
{
    window.location = "checkout.jsp"
}



