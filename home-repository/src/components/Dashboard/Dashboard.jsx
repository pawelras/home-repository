import { React, useState } from "react";
import { useSelector } from "react-redux";
import { Orders } from "../Orders/Orders";
import { useNavigate } from 'react-router-dom';
import { ToastContainer, toast, Zoom, Bounce } from 'react-toastify';
import "react-toastify/dist/ReactToastify.css";
import './Dashboard.css';



export const Dashboard = () => {

    
    const navigate = useNavigate()
    const user = useSelector(state => state.dashboard.user);

    const [userDetails, setUserDetails] = useState(user); 

    const handleDelete = () => {
        console.log('deleting');
        fetch("/users/deleteAccount", { method: 'DELETE', credentials: 'include'})
        .then(response => { if (response.ok) {
        
            window.location.href = '/';
        }})
        .catch(error => console.log(error))
    }

    const handleChange = ({target}) => {
        
        setUserDetails({...userDetails, 
            [target.name]: target.value});


    }

    const detailsUpdatedMessage = () => {
        toast.configure();
        
        toast.success('Details Updated', {
            autoclose: 1000,
            position: "bottom-center",
            hideProgressBar: true,
        }
        );
    }
    
    const handleUpdate = (e) => {
        e.preventDefault();
        fetch("/users/update", {   method: 'PUT',
                                                credentials: 'include',
                                                headers: {'Content-Type': 'application/json'},
                                                body: JSON.stringify({firstName: userDetails.first_name, lastName: userDetails.last_name, email: userDetails.email, address: userDetails.address})
                                                
                                            
                                            }).then(response => {
                                                if (response.ok) {
                                                    detailsUpdatedMessage();
                                                }
                                                else {
                                                    console.log('not updated')
                                                }
                                            })
                                            .catch(e => console.log(e));
        



    }

    const toggleDelete = () => {
        const deleteDiv = document.getElementById("delete");
        deleteDiv.style.display = deleteDiv.style.display === "none" ? "block" : "none";
    }

    

    if (!user) return <p>Loading</p>

    return (
        <div>
            <h1>👋 Hello {user.first_name}&nbsp; &nbsp;<a href="/users/logout"><input type="button" value="Logout" /></a></h1> 
    
            <div className="dashboardContainer">
                <Orders />
                <div>
                    <h3> Your Details:</h3>
                    <form onSubmit={handleUpdate}>
                        
                        <div>
                            <label for="firstName">First Name</label>
                            <input type="text" id="first_name" name="first_name" onChange={handleChange} value={userDetails.first_name}  required/>
                        </div>
                    
                        <div>
                            <label for="lastName">Last Name</label>
                            <input type="text" id="last_name" name="last_name" onChange={handleChange} value={userDetails.last_name} required/>
                        </div>
                    
                        <div>
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" onChange={handleChange} value={userDetails.email} required/>
                        </div>
                        
                        <div>
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" onChange={handleChange} value={userDetails.address} placeholder="Delivery Address" required/>
                        </div>
                        <div>
                            <input type="submit" value="Update Details" />
                            </div>
                         </form>   
                        <div>
                            
                            

                            <button onClick={toggleDelete}>DELETE ACCOUNT</button>
                            <div id="delete" style={{"display": "none", "margin-bottom": "50px"}}>
                                <p style={{"min-width": "150px", "color": "red"}}>Are you sure? </p>
                                <div style={{"display": "flex"}}>
                                    <button onClick={handleDelete} >Yes</button>
                                    <button onClick={toggleDelete}>NO</button>
                                </div>
                            </div>
                        </div>
                        
                    
                </div>
                
            </div>
            <ToastContainer autoClose={2000} />
        </div>
    )
};
