1. terraform azure provider from registry
2. Create SP credentials
    -> OPens app registrations
    -> New registrations -> Single Tenant only - Default directory
    -> Create client secret. Now we have client ID, cleint Secret id and tenant ID
3. Subscription id is required. Go to subscriptions -> Access control (IAM) -> roles and Assignments -? Add role assignment
    -> Privledged admin role -> choose contributor
    -> Members -> add yor app registrations
4. Now terraofrm plan and apply to create resources