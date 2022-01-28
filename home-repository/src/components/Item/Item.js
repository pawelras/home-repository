import React from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from "react";
import { fetchItems } from "../Items/ItemsSlice";
import { ToastContainer, toast, Zoom, Bounce } from 'react-toastify';
import "react-toastify/dist/ReactToastify.css";
import './Item.css';
import ReactImageMagnify from 'react-image-magnify';
import { fetchCartItems } from "../Cart/CartSlice";
import { useNavigate } from 'react-router-dom';



const loginUrl = "/users/login"

export const Item = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();

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
   
    useEffect(() => {
        dispatch(fetchItems())
    }, [dispatch])


    const {itemId} = useParams()

    const intId = Number(itemId);
    const items = useSelector(state => state.items.items);
    
    

    const item = items.find(e => e.id === intId);
    console.log(item);
    
    const src = `${process.env.PUBLIC_URL}/images/${itemId}.jpg`;

    const addToCart = ({target}) => {
       if (item.quantity < 1 ) {

        toast.warn('Cannot add item', {
            autoclose: 3000,
            position: "top-center",
            hideProgressBar: true,
        }
        );

       } else
        
       { fetch(`/users/cart/${intId}`, { method: 'POST', credentials: 'include'})
        .then(response => {
            if (response.ok) {
                dispatch(fetchCartItems());
                addedMessage();
            }
            else {
            loginMessage()

               setTimeout(()=> { window.location.href = loginUrl }, 3000)
                               
            }

        });}
    
    }

    const handleGoBack = () => {
        navigate(-1)
    }
    
    
    if (!item) {
        return <p> Loading </p>
    }

    return (
        <div>
            <span className="goBack" onClick={handleGoBack}> &#11164; Back</span>
            <h3>{item.name}</h3>
            
            
            <div className="itemContainer">
                
                <div className="magnifier">
                    <ReactImageMagnify {...{
                        smallImage: {
                            
                            isFluidWidth: true,
                            src: src,
                            sizes: '(min-width: 800px) 33.5vw, (min-width: 415px) 50vw, 100vw'
                        },
                        largeImage: {
                            src: src,
                            width: 1200,
                            height: 800
                        }
                        }} />
                        
                </div>
                <div className="descriptionContainer">
                    <p>{item.description}</p>
                    <p className="price"> Price: £{item.price}</p>
                    <p className="inStock">In stock: {item.quantity}</p>
                </div>
            </div>
            
            <button id={intId} onClick={addToCart}>Add to Cart</button>
            <ToastContainer autoClose={2000} />
        </div>
    )
}