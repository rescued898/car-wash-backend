<?php

function apiResponse($code = 200, $message = 'success', $data = [])
{
    return compact('code','message', 'data');
}

function apiExceptionResponse($code = 500, $message = 'success', $errors = [])
{
    return compact('code','message', 'errors');
}
