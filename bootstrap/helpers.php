<?php

function apiResponse($code = 200, $message = 'success', $data = [])
{
    return compact('code','message', 'data');
}
