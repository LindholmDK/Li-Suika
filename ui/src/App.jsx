import { useEffect, useRef, useState } from 'react';
import './App.css';

const devMode = true;

const App = () => {
    const appDiv = useRef(null);





    return (
        <AppProvider>
            <div className='app' ref={appDiv}>
                <div className='top'></div>
                <iframe title="Suika Watermelon Game Frame" id="iframehtml5" class="d-block" width="100%" height="100%" src="https://suikagame.io/game/suika-game/" frameborder="0" border="1" scrolling="no" data-wg-content="true"></iframe>
            </div>
        </AppProvider>
    );
};

const AppProvider = ({ children }) => {
    if (devMode) {
        return <div className='dev-wrapper'>{children}</div>;
    } else return children;
};

export default App;
