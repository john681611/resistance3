private _PLR=_this;private _nAI=player nearEntities["Man",9]select{!isPlayer _x};
if(count _nAI>0)then{{if(_x knowsAbout _PLR<=1.5)then{[_x,[_PLR,1.5]]remoteExec["reveal",2]}}forEach _nAI}