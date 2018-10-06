call {while {true} do
        {
            {
                (_x select 2) setMarkerPos getPos (_x select 1);
                sleep 1; 
            } forEach MHQs
        }
    };
