import React from "react";
import { useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import { ToastContainer, toast } from 'react-toastify';
import "react-toastify/dist/ReactToastify.css";
import { fetchCartItems } from "../Cart/CartSlice";
import './ItemTile.css';
import { useNavigate } from 'react-router-dom';

export const ItemTile = (props) => {

    const dispatch = useDispatch();
    const navigate = useNavigate();

      const addedMessage = () => {

        toast.success('Item Added', {
            autoclose: 1000,
            position: "bottom-center",
            hideProgressBar: true,
        }
        );
    }

    const loginMessage = () => {
        toast.warn('Please Log in', {
            autoclose: 3000,
            position: "top-center",
            hideProgressBar: true,
        }
        );
    }

    
    const loginUrl = "/users/login"
    const linkToItem = `/items/${props.item.id}`;
    const imageSource = `images/${props.item.id}.jpg`;
    

    

    const addToCart = ({target}) => {
        
      if(props.item.quantity <1 ) { 
            
        toast.warn('Cannot add item', {
            autoclose: 3000,
            position: "top-center",
            hideProgressBar: true,
        }
        );

      }
      
      
      else  {const id = target.id;
        
        fetch(`/users/cart/${id}`, { method: 'POST', credentials: 'include'})
        .then(response => {
            if (response.ok) {
                dispatch(fetchCartItems())
                addedMessage();

            }
            else {
            loginMessage()

               setTimeout(()=> { window.location.href = loginUrl }, 3000)
                               
            }            

        })
        .catch(error => console.log(error));}
    
    }
   
    
    return (
        <div className="itemTileContainer">
            <Link className="link" to={linkToItem}><h3>{props.item.name}</h3></Link>
            <div>
                <Link className="link" to={linkToItem}><img  src={imageSource}/></Link>
            </div>
            <p className="tilePrice">Price: £{props.item.price}</p>
            <p>In stock: {props.item.quantity}</p>
            <button id={props.item.id} onClick={addToCart}>Add to Cart</button>
            <ToastContainer autoClose={2000} />
        </div>
    )
}