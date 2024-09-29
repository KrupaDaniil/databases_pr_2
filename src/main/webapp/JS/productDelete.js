document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("dlForm").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch(this.action, {
            method: "DELETE",
        }).then(response => {
            if (response.ok) {
                location.reload();
            }
            else {
                console.error(response.error);
            }
        })
    })
})