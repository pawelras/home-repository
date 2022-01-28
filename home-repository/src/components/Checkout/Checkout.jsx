import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchCartTotal } from "../Cart/CartSlice";
import { useNavigate } from 'react-router-dom';
import { fetchCartItems } from "../Cart/CartSlice";

export const Checkout = () => {

    const cartItems = useSelector(state => state.cart.cartItems);
    const items = useSelector(state => state.items.items);
    const user = useSelector(state=> state.dashboard.user);
    const total = useSelector(state => state.cart.cartTotal);
    console.log(cartItems);

    const date = new Date().toISOString().substring(0,10);
    

    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        dispatch(fetchCartTotal())

    }, [dispatch])

    const handlePay = (e) => {
        console.log(e.target);
        e.preventDefault();
        console.log('paid');
        fetch("/users/orders", {method: 'POST', credentials: "include"})
        .then(response => { if (response.ok) {
            // window.location.href = '/orders'
            dispatch(fetchCartItems());
            navigate('/orders', {replace: true});
        }})
        .catch(error => console.log(error))     

    }

    
    return (
    <div>
        

        <h3> Total: £{total[0]?.sum}</h3>
        <div>

        <form onSubmit={handlePay}>
            <label>Card Number  <input type="number" max={99999999999999998} required></input></label>
        
            <label>Expiry date  <input type="date" min={date} required></input> </label>
            
            <label>Security Code <input type="number" max={999} required></input></label>

            <input type="submit" value="Pay Now"/>

        </form>
        
        </div>


        
    </div>)
}