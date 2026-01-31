#!/bin/bash
# Sets up branch protection rules for the repository
# Usage: ./scripts/setup-branch-protection.sh

REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)

if [ -z "$REPO" ]; then
  echo "❌ Not in a GitHub repository"
  exit 1
fi

echo "🔒 Setting up branch protection for $REPO..."

gh api repos/$REPO/branches/main/protection -X PUT \
  -H "Accept: application/vnd.github+json" \
  -f required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":true}' \
  -f enforce_admins=false \
  -F required_status_checks=null \
  -F restrictions=null \
  -F allow_force_pushes=false \
  -F allow_deletions=false

if [ $? -eq 0 ]; then
  echo "✅ Branch protection enabled on main"
  echo "   - Requires 1 approving review"
  echo "   - Dismisses stale reviews on new commits"
else
  echo "❌ Failed to set branch protection"
  exit 1
fi
