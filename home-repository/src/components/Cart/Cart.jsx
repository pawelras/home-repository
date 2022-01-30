import { React, useEffect } from "react";
import { useSelector, useDispatch} from "react-redux";
import { useNavigate } from 'react-router-dom';
import { fetchCartItems, clearCart, fetchCartTotal } from "./CartSlice";
import { fetchUser } from "../Dashboard/DashboardSlice";
import { fetchItems } from "../Items/ItemsSlice";
import { ToastContainer, toast} from 'react-toastify';
import "react-toastify/dist/ReactToastify.css";
import "./Cart.css";



export const Cart = () => {

    const cartItems = useSelector(state => state.cart.cartItems);
    const cartTotal = useSelector(state => state.cart.cartTotal)
    const user = useSelector(state=> state.dashboard.user);
    const imageSrc = `images/`;

    const dispatch = useDispatch();
    const navigate = useNavigate();


    useEffect(() => {
        dispatch(fetchUser())
    }, [dispatch]);

    useEffect(()=> {
        dispatch(fetchCartItems())
    }, [dispatch]);

    useEffect(() => {
        dispatch(fetchCartTotal())
    }, [dispatch]);

    
    
    const emptyCart = () => {

        dispatch(clearCart())
        fetch("/users/cart/empty", {method: 'DELETE', credentials: "include"})
        .then(response => console.log(response))
        .catch(error => console.log(error));

        dispatch(fetchItems());
        
    }

    const removeItem = (e) => {
        fetch(`/users/cart/${e.target.id}`, {method: 'DELETE', credentials: "include"})
        .then(response => { if (response.ok) {
            dispatch(fetchCartItems());
        }})
        .catch(error => console.log(error));
        
    }

    const handleCheckOut = () => {
        if (!user.address) {
            toast.configure();
            toast.warn('Please provide delivery address in Account section.', {
                autoclose: 5000,
                position: "top-center",
                hideProgressBar: true,
            }
            );
        } else {
            
            navigate('/cart/checkout', {replace: true})
        }
    }

    
    if (cartItems.length === 0) { return (
        <div>
        <h3>Hello {user.first_name},</h3>
        <h2>🛒</h2>
        <p> Your cart is empty. Feel free to browse our products on the main page or see your orders in Account section.</p>
        
    </div>
    )}


    return (
        <div>
            <h3>Hello {user.first_name}</h3> 

            <h4>These are the items your cart:</h4>
            <table className="cartTable">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Qty</th>
                        <th>Price</th>
                        <th>Sum</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {cartItems.map(item => {
                        if(item.user_id) {
                        return(<tr>
                            <td>{item.name}</td>
                            <td>{item.quantity}</td>
                            <td>£{item.price}</td>
                            <td>£{item.total}</td>
                            <td><img alt={item.name} className="cartThumbnail" src={imageSrc + item.item_id + ".jpg"}></img></td>
                            <td><button id={item.item_id} onClick={removeItem}>remove </button></td>
                        </tr>)}
                        
                                              
                    })}
                </tbody>
            </table>
            <h5>Total: £{cartTotal[0]?.sum}</h5>
            <button onClick={handleCheckOut}>Checkout</button>
            <button onClick={emptyCart}>Empty Cart</button>
            <ToastContainer autoClose={2000} />
        </div>
    )
}
