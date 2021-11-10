# Sample Project

## Malcolm's Notes

* You need both postgresql and Redis running in the background in order for the database and TurboStreams to work, respectively.
* You may need to run `alter role postgres superuser createrole createdb replication;` inside of your postgres db instance in order to get Rails to connect.
* Everything else should be contained in the Gemfile
* `rake db:seed` will seed the initial databse.
* I used Bootstrap as some basic CSS to make the page look a little nicer.

## Objective

This repo is meant to be the basis for a small sample project.  The project is meant to demonstrate your approach to a semi-contrived business problem.  It is meant to take an hour or two and give a framework for demonstrating technical and problem solving skills.  Some implementation specifics are intentionally left vague to let you decide what works best.

Expectations & Notes:

* You should fork this repo and build your own example on your own Github account.
* We're not looking for a UI/UX designer, but make some effort to make it presentable.  
* Extra dependencies, if any, should be clearly included in the Gemfile/Dockerfile
* This is not meant to be an exercise in writing preciesly to a spec, but in writing some code worthy of a discussion.  Improvise accordingly.
* Use any library/gem/tool you want for any part of the project, as long as it can be easily reproduced using the configs/docs in your repo.  Just be prepared to defend your choices.

## The Project

### Background Information

Dr. Smith runs a small dental practice, Happy Smiles Dentistry.  It's a modest practice, with just himself, one dental hygienist (Cindy), and someone at the front desk (Jerry).

In the course of business, Happy Smiles maintains a very simple accounting ledger.  Each entry in the ledger should have a few components:

1. A code which represents the transaction type.  The code can indicate a procedure performed on a patient (like a Dental Cleaning, or a Whitening procedure), or a payment from the patient (cash, credit card, etc).  Codes are global -- a dental cleaning for one patient uses the same code as the cleaning for another.  They are standardized by the American Dental Association and called [CDT Codes](https://www.ada.org/en/publications/cdt)
1. For procedures, a positive "charge" value is present.  This is the amount of money the procedure costs and is billed for.
1. For payments, a negative "credit" value is present.  This is the amount of money paid by the patient.
1. A balance is maintained on each ledger entry, which shows the running balance amount due from, or owed to, a patient.
1. Each ledger entry has a date/timestamp indicating when the procedure was performed, or when the payment was received.
1. For procedures, there is a flag to indicate if the procedure was performed by Dr. Smith or his hygienist.


### The Goal

In an effort to spruce up his operation, Dr. Smith would like a simple dashboard to help understand where his biggest outstanding collections lay.  Ideally he wants his front desk employee (Jerry) to spend any free time calling patients to follow up on unpaid bills, but he wants him to focus on the accounts with the largest and oldest balances.

1. Create a database schema using the information above as a guide, and with the data in the `sample_data` folder.  You may need to modify the data a bit as you import it.  Use your best judgement to make it work.
1. Build a simple dashboard for Jerry to quickly and easily see what balances are outstanding, and to whom.
1. The dashboard should rank patients in two ways: by largest outstanding balance (total charges minus total credits), and by oldest unpaid balance.  It should be easy to figure out how to contact the patient to follow up on an unpaid balance.
1. There should be a way to enter a new payment.
1. Dr. Smith may want a "kiosk mode" of this app -- meaning a PC/TV screen with the application loaded in the breakroom, but which does not have a keyboard or mouse.  This means it will need to be able to update automatically without human interaction when a new payment or procedure is entered.

Some seed data is provided in the `sample_data` folder of this project.

### What you do _not_ need to do

1. Do not worry about authentication or authorization.  It can be wide open.
1. Don't worry about anything related to processing payments, you only need to input that they happened.


### Technical Notes

1. There is a [VSCode Dev Container](https://code.visualstudio.com/docs/remote/containers) definition in this project (in the `.devcontainer` folder) which provides setup for a Postgres DB.  You can use that if you want, or something else, but make it easy for someone else to setup the project and get it running themselves.  You don't have to use Postgres, but you should use some DB.
1. Using some JavaScript is fine, though not strictly required, but this should primarily be a Rails app, not an SPA+API.