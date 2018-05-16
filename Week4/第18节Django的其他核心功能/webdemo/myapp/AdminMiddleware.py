from django.shortcuts import render
from django.http import HttpResponse
import re

class AdminLoginMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.
        print("bbbbbbbbbbb")
    def __call__(self, request):
        print("aaaaaaaaaaa")
        response = self.get_response(request)
        return response