document.addEventListener("DOMContentLoaded", ()=>{
    let form = document.forms[0];

    form.addEventListener("submit", function (e){
        e.preventDefault();

        let values = [];

        for(let i= 0; i < form.length; i++) {
            if (form.elements[i].value) {
                values.push(form.elements[i].value);
            }
        }

        if (form.length === values.length) {
            let Product = {
                Id: values[0],
                ProductName: values[1],
                Price: values[2],
                SellerId: values[3],
            }

            fetch("product-servlet", {
                method: "PUT",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(Product),
            }).then(r => r.json()).then(data => {
                window.location.href = data.path;
            });
        }
    })
});