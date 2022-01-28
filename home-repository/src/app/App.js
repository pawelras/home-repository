import { Header } from '../components/Header/Header';
import { Categories } from '../components/Categories/Categories';
import { Items } from '../components/Items/Items';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import { Dashboard } from '../components/Dashboard/Dashboard';
import { Item } from '../components/Item/Item';
import { Cart } from '../components/Cart/Cart';
import { Checkout } from '../components/Checkout/Checkout';
import { Orders } from '../components/Orders/Orders';
import './App.css';


function App() {
 
  
  return (
    <Router>
      <div className="App">
        <Header/>
        
        <Routes>
        
          <Route exact path="/" element={<Items />}></Route>
          <Route exact path="/items/:itemId" element={<Item />}></Route>
          <Route exact path="/dashboard" element={<Dashboard />}></Route>
          <Route exact path="/cart" element={<Cart />}></Route>
          <Route exact path="/cart/checkout" element={<Checkout />}></Route>
          <Route exact path="/orders" element={<Orders />}></Route>
          
        </Routes>
      </div>
    </Router>
  );
}

export default App;
