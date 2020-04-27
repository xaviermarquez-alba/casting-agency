#!/bin/bash
export FLASK_APP=app.py
export AUTH0_DOMAIN='xaviermm.auth0.com'
export CLIENT_ID='"0W7IYhnZdwsZm8rCEeDHT8PkaQnodqPv"'
export CLIENT_SECRET='"fHdrn7JF-W2YVUrjiUuQRnh3NwnFdhc_gKniU385ljOJrA6GpcrZV4xiyV814Elo"'
export AUDIENCE='"casting-agency"'

GET_TOKEN=$(curl --request POST \
  --url https://${AUTH0_DOMAIN}/oauth/token \
  --header 'content-type: application/json' \
  --data '{"client_id": '${CLIENT_ID}',"client_secret":'$CLIENT_SECRET',"audience":'$AUDIENCE',"grant_type":"client_credentials"}')
# JWT Toke with all permissions
export JWT_TOKEN=`echo ${GET_TOKEN} | jq -r '.access_token'`
# JWT for test RBAC expires (2020-05-04)
export JWT_CASTING_ASSIST='eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InhPR1JhQkdoNGRJVURMTXlMM3RiSiJ9.eyJpc3MiOiJodHRwczovL3hhdmllcm1tLmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1ZWE2MThiOTZiNjliYzBjMTJkODFjOGUiLCJhdWQiOiJjYXN0aW5nLWFnZW5jeSIsImlhdCI6MTU4Nzk0NTkzMiwiZXhwIjoxNTg4NjM3MTMyLCJhenAiOiIwVzdJWWhuWmR3c1ptOHJDRWVESFQ4UGthUW5vZHFQdiIsImd0eSI6InBhc3N3b3JkIiwicGVybWlzc2lvbnMiOlsiZ2V0OmFjdG9ycyIsImdldDptb3ZpZXMiXX0.g2yRXA84xVaZTIpZxgggOeyKoU3A89bb2oqaYrJW4cDEoMwrHEW-6D4dJgOsPJPbwgWwIFpsvu4qPN7AhN-8XrFgNgZ3HfTal0p2Dt0gSmVtTzE11Ol1pRtuRqOK87-LXOFq99PXNyci8AvREeIlM4wET8GU3GxdxtwsCicSg26W-xYsTOMEg0YYOu6oxiCeEHssxeewiqsd9uqF6HIED8MlZOhiTlfDTL_reAF1h2nu4E6J9n6zvb3gkXZGtalJ8pL0WgDTI9ewwXnS69OQJZXsuG131N86eTwzPexCRpbH5QG8sxm4h8OvoamBFXTNAmESH7xS236vSwasz2OrPw'
export JWT_CASTING_DIRECTOR='eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InhPR1JhQkdoNGRJVURMTXlMM3RiSiJ9.eyJpc3MiOiJodHRwczovL3hhdmllcm1tLmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1ZWE2MjMzMDZiNjliYzBjMTJkODMwNWQiLCJhdWQiOiJjYXN0aW5nLWFnZW5jeSIsImlhdCI6MTU4Nzk0NjQxMSwiZXhwIjoxNTg4NjM3NjExLCJhenAiOiIwVzdJWWhuWmR3c1ptOHJDRWVESFQ4UGthUW5vZHFQdiIsImd0eSI6InBhc3N3b3JkIiwicGVybWlzc2lvbnMiOlsiZGVsZXRlOmFjdG9ycyIsImdldDphY3RvcnMiLCJnZXQ6bW92aWVzIiwicGF0Y2g6YWN0b3JzIiwicGF0Y2g6bW92aWVzIiwicG9zdDphY3RvcnMiXX0.XX-XrJ4xCe-usyjx1FpxRbNwzdX4CH9XgXZeojx9xF9ndbVxg-VWOAIzdBZyLLPnW6Isq6CtuEwZMiys_XNKqVYQCElh9lOzKK2_esJTnmXcrB2pkI5r7MslbqFxjMhr2fyfoXSmYSrJcXxE2raxgWJjEBueLSZwSVKY9HZckybXMZoGd2tPqYFDs7gL1tygJ5FGEQdRtrXqjLyIb0DyAwM9fjWs4oE5F68p4FDL6UrVe8ZDUr4atz73T87X_AMXjKVwknK4EG4twYqpRIRWer4atBbGZ-1YtC7ZaxLgB9TKteihWk4exJyejL26kEjjAdAcAsiwLGhLJ11NuK3ehA'
export JWT_EXECUTIVE_PRODUCER='eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InhPR1JhQkdoNGRJVURMTXlMM3RiSiJ9.eyJpc3MiOiJodHRwczovL3hhdmllcm1tLmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1ZWE2MjM2NzFjYzFhYzBjMTQ2OGEyZTAiLCJhdWQiOiJjYXN0aW5nLWFnZW5jeSIsImlhdCI6MTU4Nzk0NjQ3OSwiZXhwIjoxNTg4NjM3Njc5LCJhenAiOiIwVzdJWWhuWmR3c1ptOHJDRWVESFQ4UGthUW5vZHFQdiIsImd0eSI6InBhc3N3b3JkIiwicGVybWlzc2lvbnMiOlsiZGVsZXRlOmFjdG9ycyIsImRlbGV0ZTptb3ZpZXMiLCJnZXQ6YWN0b3JzIiwiZ2V0Om1vdmllcyIsInBhdGNoOmFjdG9ycyIsInBhdGNoOm1vdmllcyIsInBvc3Q6YWN0b3JzIiwicG9zdDptb3ZpZXMiXX0.NFzA-Mc7S8GrScsSk8uOgswCtVaxpndKQDHGT5-gprAXu3aW6m3AU93Li4qYZ9NvcB6K8rfGk2dERkZ62Erzr4OILfmj05IeIbSGlf1PFh-GakfkslC8ATOTh0x-3Bmcs5MNV9rbIVLdIQrmAIMfGezhMzGMd12DGRh2MX6k47Bw6lZVCuQfjlJmtJegZ7wTdYJ3me585qW8NRTjYKhNtKAxpZX-7brMc9nWhVwsgyFBigEYtudErULPGh2ZvaPlCMZn4PyqJHzciBmrTAlKrrl66tC3rl4wU1lu_0Xh-5SRKIq0SkG8c4j2siFU6ScDnPCzK695GpCQ2MKhDkEFdw'
export DATABASE_URL="postgresql://postgres:1234@192.168.0.108:5432/casting_agency"
