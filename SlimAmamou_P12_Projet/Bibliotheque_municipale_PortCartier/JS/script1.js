
function desableForm(){
    document.getElementById("btnAddEmploye").disabled = true;
    document.getElementById("btnAddMember").disabled = true;
}

function quitFormMembers()
{
    anime({
        targets: '#membreDiv',
        keyframes: [
            {translateY: -5000, duration:50}
        ],
        loop:false
    });
}

function quitFormEmploye()
{
    anime({
        targets: '#employeDiv',
        keyframes: [
            {translateY: -5000, duration:50}
        ],
        loop:false
    });
}