import cx from 'classnames';
import React, { Component } from 'react';

export default function Counter() {
    
    // declare our state variable to keep track of count
    const [count, setCount] = React.useState(42);

    return (
        <>
            <style>{`
                .counter-button {
                    font-size: 1rem;
                    padding: 5px 10px;
                    color:  #585858;
                }
            `}</style>

            <div>
                <h2 className="counter">Counter {count}</h2>
            </div>

            <button onClick={ ()=> setCount(count + 1) } > Click </button>
        </>
    );
    
}


import cx from 'classnames';
import { Component } from 'react';

export default class Counter extends Component {
    constructor(props) {
      super(props);
      this.state = {
        count: 42
      };
    }
  
    render() {
      return (
          <>
            <style>{`
                    .counter-button {
                        font-size: 1rem;
                        padding: 5px 10px;
                        color:  #585858;
                    }
                `}</style>
            <div>
                <h2 className='counter' >{this.state.count}</h2>
            </div>
            
            <button className='counter-button' onClick={() => this.setState({ count: this.state.count + 1 })}>
                Click
            </button>

          </>
      );
    }
  }


import cx from 'classnames';
import React, { Component } from 'react';

export default function Counter() {
    
    // declare our state variable to keep track of count
    const [count, setCount] = React.useState(42);

    return (
        <>
            <style>{`
                .counter-button {
                    font-size: 1rem;
                    padding: 5px 10px;
                    color:  #585858;
                }
            `}</style>

            <div>
                <h2 className="counter">{count}</h2>
            </div>

            <button className="counter-button" onClick={ ()=> setCount(count + 1) } >Click</button>
        </>
    );
    
}
