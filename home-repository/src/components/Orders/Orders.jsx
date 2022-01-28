import { React, useEffect } from "react";
import { useDispatch, useSelector} from "react-redux";
import { fetchOrders } from "./OrdersSlice";
import "./Orders.css";


export const Orders = () => {

    const dispatch= useDispatch();

    const orders = useSelector(state => state.orders.orders);
    console.log(orders)
    
    
    
    useEffect(()=> {
        dispatch(fetchOrders())
    }, [dispatch])



    return (

        <div>

            <h3> Your current orders</h3>


            <table className="ordersTable">
                <thead>
                    <tr>
                        <th>Order Number</th>
                        <th>Total</th>
                        <th>Date</th>
                        
                    </tr>
                </thead>
                <tbody>
                    {orders.map(order => (
                        <tr>
                            <td>✔️{order.id}</td>
                            <td>£{order.total}</td>
                            <td>{order.order_date.substring(0,10) + ' at ' + order.order_date.substring(11,19)}</td>
                                       
                        </tr>
                        ))
                        }
                        
                                            
                </tbody>
            </table>

                
        </div>
    )
}

