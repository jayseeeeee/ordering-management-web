const pinInput = document.getElementById("pin");
const message = document.getElementById("message");

pinInput.addEventListener("input", function () {

    this.value = this.value.replace(/[^0-9]/g, '');
    this.value = this.value.slice(0, 6);

    if (this.value.length === 6) {
        login();
    }
});

async function login() {
    try {
        const response = await fetch('/validate-pin', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                pin: pinInput.value
            })
        });

        const data = await response.json();

        if (data.success) {

            message.innerHTML = `
                <span class="text-success">
                    Access Granted...
                </span>
            `;

            setTimeout(() => {
                window.location.href = '/dashboard.html';
            }, 1000);

        } else {

            message.innerHTML = `
                <span class="text-danger">
                    Invalid PIN
                </span>
            `;

            pinInput.value = '';
        }

    } catch (err) {

        message.innerHTML = `
            <span class="text-danger">
                Server Error
            </span>
        `;
    }
}