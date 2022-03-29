import cx from 'classnames';
import React, { Component } from 'react';

export default function LikeButton(){

    const[count, setCount] = React.useState(101);
    const[buttonPress, setButtonPress] = React.useState(false)

    // function setLikeStatus(){
    //     buttonPress ? setCount(count - 1) : setCount(count + 1);
    //     setButtonPress(true);
    // };

    function handleClick(){
        (prevButtonPress) => setButtonPress( !prevButtonPress ) 
    };
    
    return (
        <>
            <div>
                <h2>Like Button {buttonPress ? 'TRUE' : 'FALSE'} </h2>
            </div>
            <style>{`
                .like-button {
                    font-size: 1rem;
                    padding: 5px 10px;
                    color:  #585858;
                }
                .liked {
                    font-weight: bold;
                    color: #1565c0;
                }
            `}</style>

            <button className="like-button" onClick={ () => onClick() }>
                <span className="liked" > Like | {count} </span>
            </button>
        </>
    );
}
