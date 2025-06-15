# Contributing to Bitcoin & DigiByte Docker Setup

Thank you for your interest in contributing to this project! We welcome contributions from the community.

## 🤝 Ways to Contribute

- 🐛 **Bug Reports**: Found a bug? Please open an issue with details
- 💡 **Feature Requests**: Have an idea? We'd love to hear it
- 📝 **Documentation**: Help improve our docs
- 🔧 **Code Contributions**: Submit pull requests with improvements
- 🧪 **Testing**: Test on different platforms and report results

## 📋 Before You Start

1. Check existing [issues](../../issues) and [pull requests](../../pulls)
2. For major changes, open an issue first to discuss
3. Follow the project's coding standards
4. Test your changes thoroughly

## 🚀 Getting Started

### Development Setup

```bash
# Fork and clone the repository
git clone https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes.git
cd docker-bitaxe-merge-mining-nodes

# Make the script executable
chmod +x manage-nodes.sh

# Set up your environment
./manage-nodes.sh setup-env
# Edit .env with test credentials

# Test the setup
./manage-nodes.sh build
./manage-nodes.sh start
./manage-nodes.sh status
```

### Making Changes

1. **Create a branch**: `git checkout -b feature/your-feature-name`
2. **Make your changes**: Follow the coding guidelines below
3. **Test thoroughly**: Ensure all functionality works
4. **Commit your changes**: Use clear, descriptive commit messages
5. **Push and create PR**: Submit your pull request

## 📏 Coding Guidelines

### Shell Scripts (manage-nodes.sh)
- Use consistent indentation (4 spaces)
- Add comments for complex logic
- Use descriptive function and variable names
- Follow existing error handling patterns
- Test all code paths

### Docker Files
- Use multi-stage builds when appropriate
- Minimize image layers
- Add meaningful comments
- Follow security best practices (non-root users)
- Pin specific versions where possible

### Documentation
- Use clear, concise language
- Include examples where helpful
- Update README.md for user-facing changes
- Keep documentation up-to-date with code changes

## 🧪 Testing

### Required Testing
- Test on different operating systems (Linux, macOS, Windows with WSL)
- Verify both Bitcoin and DigiByte nodes start correctly
- Test all management script commands
- Verify environment variable substitution works
- Test error conditions and edge cases

### Test Environment
- Use testnet when possible for testing
- Ensure clean shutdown of services
- Test with different .env configurations
- Verify Docker health checks work

## 📝 Pull Request Process

1. **Fill out the PR template** with details about your changes
2. **Link related issues** using "Fixes #123" or "Closes #123"
3. **Add tests** if you're adding new functionality
4. **Update documentation** if needed
5. **Ensure CI passes** (when available)
6. **Request review** from maintainers

### PR Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Tested on at least one platform
- [ ] Documentation updated (if needed)
- [ ] No merge conflicts
- [ ] Clear commit messages

## 🐛 Bug Reports

When reporting bugs, please include:

- **Operating System**: Linux distro, macOS version, etc.
- **Docker Version**: Output of `docker --version`
- **Docker Compose Version**: Output of `docker-compose --version`
- **Error Messages**: Full error output
- **Steps to Reproduce**: Clear steps to reproduce the issue
- **Expected Behavior**: What should have happened
- **Environment**: Contents of your .env file (remove passwords!)

## 💡 Feature Requests

For feature requests, please include:

- **Use Case**: Why is this feature needed?
- **Proposed Solution**: How should it work?
- **Alternatives**: Any alternative solutions considered?
- **Additional Context**: Screenshots, examples, etc.

## 🔒 Security

If you discover a security vulnerability:

1. **DO NOT** open a public issue
2. Email the maintainers privately
3. Provide details about the vulnerability
4. Wait for confirmation before disclosing

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in the project documentation. Thank you for helping make this project better!

## 📞 Getting Help

- 📖 Check the [README](README.md) and documentation
- 🔍 Search existing [issues](../../issues)
- 💬 Start a [discussion](../../discussions) for questions
- 📧 Contact maintainers for private matters

---

**Happy Contributing! 🚀**
